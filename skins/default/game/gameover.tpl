<?php
/**
 * @var $winnerRu string
 * @var $module string
 */
if($winnerRu): ?>

	<span> Победил: </span> <?=$winnerRu;?>
<?php else: ?>
	<span> Неизвестный метод </span>
<?php endif ?>
<br> <br>
<a href="<?=createUrl(['module' => $module, 'page' => 'main',])?>">New Game</a>