extends PanelContainer

@onready var animated_sprite_2d: AnimatedSprite2D = $Emote/AnimatedSprite2D
@onready var emotes_idle_timer: Timer = $EmotesIdleTimer

var idle_emotes: Array = ["emote_1_idle", "emote_2_smile", "emote_3_ear_wave", "emote_4_blink"]

func _ready() -> void:
	animated_sprite_2d.play("emote_1_idle")
	
	InventoryManager.inventory_changed.connect(on_inventory_changed)
	GameDialogueManager.feed_the_animals.connect(on_feed_the_animals)
	
func play_emote(animtion:String) -> void:
	animated_sprite_2d.play(animtion)
	

func _on_emotes_idle_timer_timeout() -> void:
	var index = randi_range(0,3)
	var emote = idle_emotes[index]
	
	animated_sprite_2d.play(emote)

func on_inventory_changed() -> void:
	animated_sprite_2d.play("emote_7_excited")
	
func on_feed_the_animals() -> void:
	animated_sprite_2d.play("emote_6_love_kiss")
