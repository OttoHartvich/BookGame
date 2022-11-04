extends RichTextLabel

func _ready():
	change_page("")
	GameEvents.connect("change_page", self,"change_page")

func change_page(_page):
	self.percent_visible = 0
	self.text = GameState.current_page.text
