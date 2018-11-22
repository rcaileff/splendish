#v1

##Resources
- There are five types of gem. Unless specified otherwise, the gems will always be in the standard order in files and displays.
 - diamond
 - sapphire
 - emerald
 - ruby
 - onyx
- A gem display will consist of the list of gem types with the associated number of gems of that type in the inventory being displayed.
- An additional resource, gold, will be added in a future version.

##Gem bank
- The bank's inventory contains a variable number of gems ranging from zero to nine of each type.
- The bank will start with seven gems of each type.

##Players
- There will be four players.  Different numbers of players will be added in a future version.
- Each player's name will contain up to 20 letters and/or numbers.  Initial implementation will hardcode names.  Player choice of name will be added in a future version.
- Each player's inventory contains a variable number of gems ranging from zero to nine of each type.
- Limits to the total number of gems a player can have at one time will be added in a future version.
- Each player will start with zero gems of each type.

##Initialize cards from a file
- The file will contain no more than 100 lines.
- Each line of the file will represent one card.
- Each card is represented by a comma-separated list in this order: cost, victory point value, and production type.
- The cost is a comma-separated sequence of five integers, with values ranging from zero to nine, representing quantities of gems.
- The victory point value is an integer ranging from zero to nine.
- The production type is a lowercase string from the list of gem names.  Other production types may be added in a future version.
- Randomizing the order of cards in a deck will be added in a future version.
- Multiple decks will be added in a future version.

##Display
- All of the players will be displayed with name and inventory.
- The bank inventory will be displayed.
- The top four cards of the deck will be displayed.  Each card will indicate its cost, victory point value, and production type.
- Initially all objects will be displayed in text.  Graphics may be added in a future version.

##Actions
- Player actions including taking gems from the bank and using gems to buy cards will be added in future versions.
