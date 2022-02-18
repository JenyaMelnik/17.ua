<?php
/**
 * @var $elements array
 */
foreach($elements as $element): ?>
	<?php if($element['type'] == TYPE_FILE): ?>
		<div>
			<img src="/img/file.jpg" width="20" height="28" alt="file"> <?=$element['name']?>
		</div>
	<?php elseif($element['type'] == TYPE_DIR): ?>
		<div>
			<img src="/img/folder.jpg" width="20" height="28" alt="folder"> &nbsp
			<a href="/index.php?module=manager&page=main&link=<?=$element['link']?>"><?=$element['name']?></a>
		</div>
	<?php elseif($element['type'] == TYPE_TO_UP): ?>
		<div>
			<a href="/index.php?module=manager&page=main&link=<?=$element['link']?>">..</a>
		</div>
	<?php endif ?>
<?php endforeach; ?>