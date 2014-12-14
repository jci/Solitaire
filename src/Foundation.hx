package entities;

class Foundation
{
	private var _cardtype : String;
	private var _cards : Array<String>;

	function new()
	{
		// initialize

		var i : Int = 0;

		for ( i in 1...52)
		{
			_cards.push("nada");
		}

	}
}
