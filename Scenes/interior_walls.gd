extends TileMapLayer
#Declairs Interior_Walls by calling the InteriorWalls TileMapLayer
@onready var Interior_Walls: TileMapLayer = $"."


func _on_kitchen_body_entered(body: Node2D):
	if body.name == "Player":
		trigger_event()
	else:
		Interior_Walls.z_index = 0
	
func _on_kitchen_body_exited(body: Node2D):
	if body.name == "Player":
		stop_event()
	
func trigger_event():
	print("The player has stepped into the trigger zone")
	Interior_Walls.z_index = 2

func stop_event():
	print("The player has stepped out of the trigger zone")
	Interior_Walls.z_index = 0
