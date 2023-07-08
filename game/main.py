from Menu import *

menu_options = ["Rozpocznij grę", "Poziom trudności: łatwy", "Wyjdź"]
menu = Menu(menu_options)
while menu.handle_events():
    menu.draw()

pygame.quit()
