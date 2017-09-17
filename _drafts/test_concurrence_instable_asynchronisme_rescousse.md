---
layout: post
title: Test de concurrence instable &#58; l'asynchronisme à la rescousse !
author:
  display_name: Philippe Blayo
tags:
- test
- asynchronisme
comments: true
---



I

````python
 import unittest
 from asyncio import ensure_future, wait, Lock
 from concurrent.futures import ThreadPoolExecutor

 import aiofiles as aiofiles
 import asynctest
 from os import remove


class TestConcurrenceAsync(asynctest.TestCase):
    def tearDown(self): remove('fichier.txt')

    async def test_acces_fichier_concurrent_ko(self):
        f1 = ensure_future(ecrit_dans_fichier_async('fichier.txt', 'ligne 1', Lock()))
        f2 = ensure_future(ecrit_dans_fichier_async('fichier.txt', 'ligne 2', Lock()))

        await wait([f1, f2])

        async with aiofiles.open('fichier.txt') as contenu:
            self.assertEqual('ligne 1\nligne 2\n', await contenu.read())

    async def test_acces_fichier_concurrent_ok(self):
        lock = Lock()
        f1 = ensure_future(ecrit_dans_fichier_async('fichier.txt', 'ligne 1', lock))
        f2 = ensure_future(ecrit_dans_fichier_async('fichier.txt', 'ligne 2', lock))

        await wait([f1, f2])

        async with aiofiles.open('fichier.txt') as contenu:
            self.assertEqual('ligne 1\nligne 2\n', await contenu.read())


class TestConcurrenceMultithreadee(unittest.TestCase):
    def tearDown(self): remove('fichier.txt')

    def test_acces_fichier_concurrent(self):
        executor = ThreadPoolExecutor(max_workers=2)
        executor.submit(ecrit_dans_fichier_sync, 'fichier.txt', 'ligne 1')
        executor.submit(ecrit_dans_fichier_sync, 'fichier.txt', 'ligne 2')

        executor.shutdown()

        with open('fichier.txt') as contenu:
            self.assertEqual('ligne 1\nligne 2\n', contenu.read())


async def ecrit_dans_fichier_async(nom_fichier, ligne, lock):
    async with lock:
        try:
            async with aiofiles.open(nom_fichier): pass
        except FileNotFoundError:
            mode_ouverture = 'w'
        else:
            mode_ouverture = 'a'

        async with aiofiles.open(nom_fichier, mode=mode_ouverture) as fichier:
            await fichier.write('%s\n' % ligne)


def ecrit_dans_fichier_sync(nom_fichier, ligne):
    try:
        with open(nom_fichier): pass
    except FileNotFoundError:
        mode_ouverture = 'w'
    else:
        mode_ouverture = 'a'

    with open(nom_fichier, mode=mode_ouverture) as fichier:
        fichier.write('%s\n' % ligne)
````python

