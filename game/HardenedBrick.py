from mechanics import *
import Brick


class HardenedBrick(Brick.Brick):
    def __init__(self, image, px, py, ball):
        super().__init__(image, px, py, ball)
        self.counter = 0

    def update(self):
        if pygame.Rect.colliderect(self.rect, self.ball.rect):
            if self.ball.rect.centerx <= self.rect.left and self.ball.speed_x > 0 \
                    or self.ball.rect.centerx >= self.rect.right and self.ball.speed_x < 0:
                self.ball.speed_x *= - 1
                self.counter += 1
            else:
                self.ball.speed_y *= -1
                self.counter += 1

            if self.counter == 2:
                self.kill()
                hit_sound = pygame.mixer.Sound(SOUNDS["BRICK_HIT"])
                hit_sound.play()
            else:
                hit_sound = pygame.mixer.Sound(SOUNDS["HARDENEDBRICK_HIT"])
                hit_sound.play()

            return True
