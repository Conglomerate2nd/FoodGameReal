extends "object.gd"

func _process(delta: float) -> void:
	if global.whiteSauceCheck or global.yellowSauceCheck:
		global.is_dragging = false
		global.milkCheck = false
		queue_free()
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			global.is_dragging =true
			global.id = objectID
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()-offset
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			global.id = 0
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self,"position",body_ref.position,.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position",initialPos,.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group('dropable'):
		is_inside_dropable=true
		body.modulate = Color(Color.LIGHT_SKY_BLUE,1)
		body_ref = body
		global.milkCheck=true
	
