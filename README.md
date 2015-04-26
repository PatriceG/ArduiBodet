# ArduiBodet	
Horloge mère pour Horloge de type *Bodet 1/2 Minute* pilotée par Arduino

**ATTENTION:** **CODE À L'ÉTAT DE PROOF OF CONCEPT!** Fonctionnel mais pour l'instant sans horloge RTC ni gestion du watchdog et du changement d'heure (ils seront poussés ici au fur et à mesure de leur implémentation)

Ce code nécessite la librairie DS3231 disponible ici: [http://m5.img.dxcdn.com/CDDriver/CD/sku.222910.rar](http://m5.img.dxcdn.com/CDDriver/CD/sku.222910.rar)

L'IDE utilisé est **AtmelStudio + VisualMicro** mais le code est normalement compatible avec l'IDE Arduino.

Les détails de la construction de l'horloge mère sont donnés ici: [http://breizhmakers.over-blog.com/tag/horlogebodet/](http://breizhmakers.over-blog.com/tag/horlogebodet/)

# Les objectifs fixés sont: #


- Faible coût
- Faible consommation électrique pour pouvoir être alimenté par une pile de 4.5V (estimation de l'autonomie avec une telle pile: entre 6 et 12 mois).
- Application automatique des changements d'heure.
- Très bonne stabilité de l'horloge (2 ppm soit environ 1 minute/an)
- Interrupteur Marche/Arrêt
- Interrupteur de mise en mode avance rapide pour mise à l'heure.


