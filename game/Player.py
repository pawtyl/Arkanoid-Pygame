from mechanics import *


class Player(pygame.sprite.Sprite):
    def __init__(self, image, px, py):
        super().__init__()
        self.image = image
        self.rect = self.image.get_rect()
        self.rect.center = px, py
        self.movement_speed = 5

    def _handle_events(self, keys_pressed):
        if keys_pressed[pygame.K_LEFT]:
            self.rect.move_ip([-self.movement_speed, 0])
        if keys_pressed[pygame.K_RIGHT]:
            self.rect.move_ip([self.movement_speed, 0])

    def update(self, keys_pressed):
        self._handle_events(keys_pressed)

        if self.rect.centerx < 212:
            self.rect.centerx = 212
        if self.rect.centerx > WIDTH-211:
            self.rect.centerx = WIDTH-211

    def draw(self, surface):
        surface.blit(self.image, self.rect)
