from mechanics import *
from Level import Level
from Brick import Brick
from HardenedBrick import HardenedBrick


class Level1(Level):
    def __init__(self, ball):
        super().__init__(ball)

    def add_bricks(self):
        width = 186
        height = HEIGHT - 650
        for j in range(11):
            brick = HardenedBrick(IMAGES['HARDENED_BRICK'], width, height, self.ball)
            width += 56
            self.set_of_bricks.add(brick)

        width = 186
        height += 23
        for j in range(11):
            brick = Brick(IMAGES['BRICK4'], width, height, self.ball)
            width += 56
            self.set_of_bricks.add(brick)

        width = 186
        height += 23
        for j in range(11):
            brick = Brick(IMAGES['BRICK3'], width, height, self.ball)
            width += 56
            self.set_of_bricks.add(brick)

        width = 186
        height += 23
        for j in range(11):
            brick = Brick(IMAGES['BRICK2'], width, height, self.ball)
            width += 56
            self.set_of_bricks.add(brick)

        width = 186
        height += 23
        for j in range(11):
            brick = Brick(IMAGES['BRICK1'], width, height, self.ball)
            width += 56
            self.set_of_bricks.add(brick)

    def update(self):
        super().update()
