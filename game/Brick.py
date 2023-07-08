from mechanics import *


class Brick(pygame.sprite.Sprite):
    def __init__(self, image, px, py, ball):
        super().__init__()
        self.image = image
        self.rect = self.image.get_rect()
        self.rect.center = px, py
        self.ball = ball

    def update(self):
        if pygame.Rect.colliderect(self.rect, self.ball.rect):
            if self.ball.rect.centerx <= self.rect.left and self.ball.speed_x > 0 \
                    or self.ball.rect.centerx >= self.rect.right and self.ball.speed_x < 0:
                self.ball.speed_x *= - 1
                self.kill()
            else:
                self.ball.speed_y *= -1
                self.kill()

            hit_sound = pygame.mixer.Sound(SOUNDS["BRICK_HIT"])
            hit_sound.play()

            return True

    def draw(self, surface):
        surface.blit(self.image, self.rect)
