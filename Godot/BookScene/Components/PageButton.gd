extends RichTextLabel

func _on_meta_clicked(meta):
	GameEvents.parseAndEmitSignal(meta)
