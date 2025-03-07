extends AnimationTree

enum {
	IDLE,
	RUN,
	WAVE,
}

var state

func _ready():
	pass
	
func change_state_idle():
	state = IDLE

func change_state_run():
	state = RUN

func change_state_wave():
	state = WAVE
