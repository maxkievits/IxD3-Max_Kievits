# IxD3-Max_Kievits
Max Kievits - Kernmodule Interaction Design 3

Voor mijn eindopdracht heb ik een map met daarop treinen die bewegen over een tijdlijn. Wanneer de aanrijding plaats vindt, worden de treinen langzaam rood en komen ze stil te staan. Ik heb er niet voor gekozen om real-time data te gebruike in het prototype (ook al heb ik er wel toegang tot) omdat het te intensief was voor het apparaat waarop ik het prototype heb gebouwd (iPad). Als je op een interactieve kaart real-time kan scrollen door tijd en zo'n 400 treinen moeten van positie veranderen, ging dat haperen (als de app uberhaupt wilde opstarten). 

Ik heb nu 3 afbeeldingen geimporteerd en verwerkt als 3 verschillende schermen. Deze schermen staan voor de
zoom-niveaus. Door op de zoom-knoppen te klikken, kan je schakelen tussen de zoom niveaus. De reden waarom het geen camera is die omhoog/omlaag beweegt maar 3 aparte schermen zijn die ik hide/unhide, is omdat iOS development niet de mogelijkheid biedt om in een scherm zoomlevel Z aan te passen. Alles is 2D.

Zoom niveau 1 - Aanrijding:
Op dit scherm zie je een trein die een overweg passeert waar een persoon voor springt. De trein staat stil op het scherm en het spoor beweegt daaronder. Het spoor is een grote afbeelding (15300px hoog) die naar beneden animeert. Dit heb ik zo gedaan om een gevoel van snelheid te creëren (want treinen rijden ook snel). Ik heb portalen naast de sporen geplaatst omdat de animeersnelheid zo snel gaat, dat door de refresh-rate van de iPad niet meer te zien is welke kant je op gaat. Met de portalen hebben gebruikers een beter gevoel van richting.

Zoom niveau 2 - Kleine kaart:
Op dit scherm zie je een kleine variant van de spoorkaart van het gebied waar de aanrijding heeft plaatsgevonden. De tijd-slider onderin produceert een float van 0.0 naar 1.0 (waarbij 0 het begin is en 1 het einde). De treinen beginnen allemaal op beginpunt 0 en eindigen op het punt waarop ze de rode cirkel raken. Ik heb in de code een functie geschreven die de huidige waarde van een float kan omzetten naar een nieuwe waarde met een andere range. De Map() functie. De meeste programmeertalen hebben die functie standaard erin zitten, alleen Objective-C had dat niet. De treinen animeer ik ook van 0.0 naar 1.0, maar dan op hun eigen gemapte range (van 0.0 naar het punt waarbij de cirkel geraakt wordt).

Zoom niveau 3 - Grote kaart:
Op dit scherm is een grotere kaart met meer treinen te zien. De werking van dit scherm is exact hetzelfde als het scherm met de kleine kaart, alleen dan met meer treinen. Ook hier is een rode cirkel te zien die precies in verhouding is met de cirkel op het kleine scherm. 
