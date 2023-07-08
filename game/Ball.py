from mechanics import *


class Ball(pygame.sprite.Sprite):
    def __init__(self, image, px, py, player, difficulty="easy"):
        super().__init__()
        self.image = image
        self.rect = self.image.get_rect()
        self.rect.center = px, py
        self.lives = 3
        self.attached = True
        self.player = player
        self.cooldown = 10

        self.difficulty = difficulty
        if self.difficulty == "easy":
            self.speed_x = -6
            self.speed_y = -6
        if self.difficulty == "hard":
            self.speed_y = -8
            self.speed_x = -8
        self.og_speed = self.speed_x

    def _handle_events(self, keys_pressed):
        if keys_pressed[pygame.K_SPACE]:
            if self.attached:
                hit_sound = pygame.mixer.Sound(SOUNDS["PLATFORM_HIT"])
                hit_sound.play()
            self.attached = False

    def update(self, keys_pressed):
        self._handle_events(keys_pressed)

        if self.attached:
            self.rect.y = self.player.rect.top - 10
            self.rect.x = self.player.rect.centerx - 8
        else:
            self.rect.y += self.speed_y
            self.rect.x += self.speed_x

            if pygame.Rect.colliderect(self.rect, self.player.rect) and self.cooldown > 9:
                if self.rect.centerx < self.player.rect.centerx and self.speed_x > 0 \
                        or self.rect.centerx > self.player.rect.centerx and self.speed_x < 0:
                    self.speed_y *= -1
                    self.speed_x *= -1
                else:
                    self.speed_y *= -1
                self.cooldown = 0

                hit_sound = pygame.mixer.Sound(SOUNDS["PLATFORM_HIT"])
                hit_sound.play()

        if self.rect.bottom > HEIGHT + 55:
            self.attached = True
            self.lives -= 1
            self.speed_x = self.og_speed
            self.speed_y = self.og_speed

        self.cooldown += 1

    def draw(self, surface):
        surface.blit(self.image, self.rect)
