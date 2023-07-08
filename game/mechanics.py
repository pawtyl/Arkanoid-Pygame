import pygame
import os

BACKGROUND = [8, 0, 32]
CADETBLUE = pygame.color.THECOLORS['cadetblue']
LIGHTBLUE = pygame.color.THECOLORS['cadetblue1']
SCREENSIZE = WIDTH, HEIGHT = 933, 768
screen = pygame.display.set_mode(SCREENSIZE)
clock = pygame.time.Clock()

path = os.path.join(os.pardir, 'images')
file_names = sorted(os.listdir(path))
IMAGES = {}

for file_name in file_names:
    image_name = file_name[:-4].upper()
    IMAGES[image_name] = pygame.image.load(os.path.join(path, file_name)).convert_alpha()

path = os.path.join(os.pardir, 'sounds')
file_names = sorted(os.listdir(path))
SOUNDS = {}

for file_name in file_names:
    sound_name = file_name[:-4].upper()
    SOUNDS[sound_name] = os.path.join(path, file_name)
