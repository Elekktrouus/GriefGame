class_name Interactable
extends StaticBody3D

signal interacted(body)

@export var prompt_message = "Interact"
@export var prompt_action = "Interact"
var simultaneous_scene = preload("res://player.tscn").instantiate()
func get_prompt():
	var key_name = ""
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			key_name = OS.get_keycode_string(action.keycode)
	return prompt_message + "\n[" + key_name + "]"
	
	
func interact(body):
	emit_signal("interacted", body)
	get_tree().root.add_child(simultaneous_scene)
	
