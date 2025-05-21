# ArduiBodet	
Horloge mère pour Horloge de type *Bodet 1/2 Minute* pilotée par Arduino


Ce code nécessite les librairies suivantes:
  -DS3231 : [http://m5.img.dxcdn.com/CDDriver/CD/sku.222910.rar](http://m5.img.dxcdn.com/CDDriver/CD/sku.222910.rar)
  -Low-Power: [https://github.com/rocketscream/Low-Power] (https://github.com/rocketscream/Low-Power)
  
L'IDE utilisé est **AtmelStudio + VisualMicro** mais le code est compatible avec l'IDE Arduino.

Les détails de la construction de l'horloge mère sont donnés ici: [http://breizhmakers.over-blog.com/tag/horlogebodet/](http://breizhmakers.over-blog.com/tag/horlogebodet/)

# Les objectifs fixés sont: 

- Faible coût
- Alimentation 9V (nécessaire pour piloter l'horloge)
- Application automatique des changements d'heure.
- Très bonne stabilité de l'horloge (2 ppm soit environ 1 minute/an)
- Interrupteur Marche/Arrêt
- Interrupteur de mise en mode avance rapide pour mise à l'heure.

# Comment Flasher le Firmware

La plupart des ATMega328 sont livrés configurés pour fonctionner avec un quartz externe à 16MHz.

Avant de pouvoir flasher le firmware il faut donc installer l'ATMega sur une Breadboard en y câblant un quartz 16MHz et ses condensateurs associés, et y brancher le programmateur (j'utilise un USBAsp).

J'ai ensuite suivi [cette doc](https://www.electrosoftcloud.com/en/changing-the-arduino-clock-speed/) avec un IDE Arduino 1.8.18, mais cela fonctionne aussi avec l'IDE Arduino 2.x, pour configurer l'Arduino en mode horloge interne 1MHz (ou 8MHz, ça fonctionne aussi).

Une fois les définitions de Board MiniCore installées et choisi ATMega328 on a accès à tout un tas de settings, dont le mode de fonctionnement de l'horloge. 
Il reste ensuite à cliquer sur "Graver la séquence d'initialisation" pour flasher cette config de fuses (avec le programmateur choisi. J'utilise un USBAsp).

Il est ensuite conseillé de flasher le sketch Blink et de vérifier que la pin correspondant à D13 clignotte bien à 1 Hz

On peut alors flasher le sketch de l'Horloge.
