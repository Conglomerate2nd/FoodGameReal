extends "platform.gd"
@onready var whiteMacLoad = preload("res://Food/WhiteMacAndCheese.tscn")
@onready var yellowMacLoad = preload("res://Food/YellowMacAndCheese.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(Color.LIGHT_CYAN,.7);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#is_dragging might be built in
func _process(delta: float) -> void:
	if (global.is_dragging and PlatformID == global.id):
		visible = true;
	else:
		visible = false;
	
	if global.pastaCheck:
		if global.yellowSauceCheck:
			global.yellowMacCheck = true #deletes all components
			print("Pasta")
			var yellowMac = yellowMacLoad.instantiate()
			add_sibling(yellowMac)
			yellowMac.global_position = self.global_position
		elif global.whiteSauceCheck:
			global.whiteMacCheck = true #deletes all components
			print("Pasta")
			var whiteMac = whiteMacLoad.instantiate()
			add_sibling(whiteMac)
			whiteMac.global_position = self.global_position
