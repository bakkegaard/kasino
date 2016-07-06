import std.traits, std.stdio, std.conv, std.algorithm : remove;
import std.random : randomShuffle;

enum Suit: string{
	CLUBS= "clubs",
	DIAMONDS= "diamonds",
	HEARTS= "hearts",
	SPADES= "spades"
}

class Card{

	//Suit of the card
	private Suit suit;

	//Rank of the card
	private int rank;

	//Constructor
	this(int r,Suit s){
		suit=s;
		rank=r;
	}

	//Public get of suit
	public auto getSuit(){
		return suit;
	}

	//Public get of Rank
	public auto getRank(){
		return rank;
	}

	//Overridden toString method
	override string toString(){
		
		//The string of the rank
		string stringRank;

		//If it's Ace, Jack, Queen or King make it print the name
		if(rank==1) stringRank= "Ace";
		else if(rank==11) stringRank= "Jack";
		else if(rank==12) stringRank= "Queen";
		else if(rank==13) stringRank= "King";

		//Otherwise just print the number
		else stringRank=  to!string(rank);

		//The string of the suit
		string stringSuit= suit;

		//Put it all together
		return stringRank~ " of " ~ stringSuit;
	}
}

class Deck{

	//The deck is an array
	Card[] deck;

	this(){
		//EnumMembers!Suit makes us able to iterate over it
		//Go through all Suits
		foreach(s ; EnumMembers!Suit){

			//And through the numbers from 1 to and including 13
			for(int i=1;i<=13;i++){
			
				//Create the card
				auto newCard= new Card(i,s);	

				//And add it to the deck
				deck~= newCard;
			}
		}
	}

	Card getCard(){

		//Take out the first card
		auto card= deck[0];

		//Remove the first card
		deck= deck.remove(0);

		//return the card
		return card;
	}

	bool empty(){
		//if the length of the deck is 0 return true
		if(deck.length==0) return true;

		//otherwise return false
		else return false;
	}

	void shuffle(){
		//use randomShuffle function to shuffle the cards
		randomShuffle(deck);
	}
}
