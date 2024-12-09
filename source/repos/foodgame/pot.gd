extends "platform.gd"

@onready var rouxLoad = preload("res://Food/Roux.tscn")
@onready var whiteSauceLoad = preload("res://Food/WhiteSauce.tscn")
@onready var yellowSauceLoad = preload("res://Food/YellowSauce.tscn")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(Color.LIGHT_CYAN,.7);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#is_dragging might be built in 

#Should override
func _process(delta: float) -> void:
	
	if (global.is_dragging and PlatformID == global.id):
		visible = true;
	else:
		visible = false;
	
	if global.butterCheck and global.flourCheck:
		global.rouxCheck = true #deletes all components
		print("RouxMade")
		var roux = rouxLoad.instantiate()
		add_sibling(roux)
		roux.global_position = self.global_position
	
	if global.rouxCheck and global.milkCheck:
		if global.yellowCheck:
			global.yellowSauceCheck = true #deletes all components
			print("YellowSauceMade")
			var yellowSauce = yellowSauceLoad.instantiate()
			add_sibling(yellowSauce)
			yellowSauce.global_position = self.global_position
		elif global.whiteCheck:
			global.whiteSauceCheck = true #deletes all components
			print("WhiteSauceMade")
			var whiteSauce = whiteSauceLoad.instantiate()
			add_sibling(whiteSauce)
			whiteSauce.global_position = self.global_position
		
	
	
