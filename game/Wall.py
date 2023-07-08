import pygame


class Wall(pygame.sprite.Sprite):
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
            elif self.ball.rect.top <= self.rect.bottom:
                self.ball.speed_y *= -1

    def draw(self, surface):
        surface.blit(self.image, self.rect)
