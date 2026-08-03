extends CharacterBody2D

const GRAVITY: int = 4200
const JUMP_SPEED: int = -1800

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	if is_on_floor(): 
		$RunCol.disabled = false
		if Input.is_action_pressed("ui_accept") || Input.is_action_pressed("ui_up"):  
			velocity.y += JUMP_SPEED
			$JumpSound.play()
		elif Input.is_action_pressed("ui_down"):
			$Sprite.play("duck")
			$RunCol.disabled = true
		else:
			$Sprite.play("run")
	else: 
		$Sprite.play("jump")
	move_and_slide()
 
