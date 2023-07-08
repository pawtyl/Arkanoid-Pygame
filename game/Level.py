from mechanics import *
from Wall import Wall


class Level:
    def __init__(self, ball):
        self.ball = ball
        self.set_of_bricks = pygame.sprite.Group()
        self.wall_left = Wall(IMAGES['WALL_LEFT'], 151, HEIGHT // 2, ball)
        self.wall_right = Wall(IMAGES['WALL_RIGHT'], 782, HEIGHT // 2, ball)
        self.wall_top = Wall(IMAGES['WALL_TOP'], WIDTH // 2, HEIGHT - 760, ball)

    def update(self):
        for b in self.set_of_bricks:
            if b.update():
                break

        self.wall_top.update()
        self.wall_left.update()
        self.wall_right.update()

    def draw(self, surface):
        self.set_of_bricks.draw(surface)

        self.wall_top.draw(surface)
        self.wall_left.draw(surface)
        self.wall_right.draw(surface)

        for i in range(self.ball.lives-1):
            surface.blit(IMAGES['BALL'], [20 + 40 * i, HEIGHT-40])
