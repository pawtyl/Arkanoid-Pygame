import pygame.mixer
from mechanics import *
from Player import Player
from Ball import Ball
from Level1 import Level1

pygame.init()

FONT_TITLE = pygame.font.SysFont('Bank Gothic', 64)
FONT_OPTIONS = pygame.font.SysFont('Courier New', 32)


class Menu:
    def __init__(self, options):
        self.options = options
        self.selected_option = 0
        self.difficulty = "easy"

    def handle_events(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return False
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_UP:
                    self.selected_option = (self.selected_option - 1) % len(self.options)
                elif event.key == pygame.K_DOWN:
                    self.selected_option = (self.selected_option + 1) % len(self.options)
                elif event.key == pygame.K_RETURN:
                    if self.selected_option == 0:
                        self.start_game()
                    elif self.selected_option == 1:
                        if self.difficulty == "easy":
                            self.options[1] = "Poziom trudności: trudny"
                            self.difficulty = "hard"
                        else:
                            self.options[1] = "Poziom trudności: łatwy"
                            self.difficulty = "easy"
                    elif self.selected_option == 2:
                        return False
        return True

    def start_game(self):
        pygame.mixer.music.load(SOUNDS["ROUND_START"])
        pygame.mixer.music.play(0)
        pygame.time.delay(500)
        pygame.display.update()
        pygame.time.delay(2500)

        player = Player(IMAGES['PLAYER'], WIDTH // 2, HEIGHT - 100)
        ball = Ball(IMAGES['BALL'], WIDTH // 2 - 7, HEIGHT - 109, player, self.difficulty)

        current_level = Level1(ball)
        current_level.add_bricks()

        while True:
            screen.fill(BACKGROUND)

            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    return
                if event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_ESCAPE:
                        return

            keys_pressed = pygame.key.get_pressed()

            current_level.update()
            player.update(keys_pressed)
            ball.update(keys_pressed)

            current_level.draw(screen)
            player.draw(screen)
            ball.draw(screen)

            if not ball.lives or not current_level.set_of_bricks:
                break

            pygame.display.flip()
            clock.tick(60)

        if not ball.lives:
            text = FONT_TITLE.render("Koniec gry", True, LIGHTBLUE)
            text_rect = text.get_rect(center=(WIDTH // 2, HEIGHT // 2))
            screen.blit(text, text_rect)

        if not current_level.set_of_bricks:
            text = FONT_OPTIONS.render("Poziom ukończony", True, LIGHTBLUE)
            text_rect = text.get_rect(center=(WIDTH // 2, HEIGHT // 2))
            screen.blit(text, text_rect)

        pygame.time.delay(500)
        pygame.display.update()
        pygame.time.delay(2500)

    def draw(self):
        screen.fill(BACKGROUND)

        for i, option in enumerate(self.options):
            if i == self.selected_option:
                color = LIGHTBLUE
            else:
                color = CADETBLUE
            text = FONT_OPTIONS.render(option, True, color)
            text_rect = text.get_rect(center=(WIDTH / 2, HEIGHT / 2 + i * 50))
            screen.blit(text, text_rect)

        title_text = FONT_TITLE.render("ARKANOID", True, CADETBLUE)
        title_rect = title_text.get_rect(center=(WIDTH / 2, HEIGHT / 2 - 100))
        screen.blit(title_text, title_rect)

        pygame.display.flip()
