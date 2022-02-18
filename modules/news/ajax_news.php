<?php

$last_news = query("
    SELECT *
    FROM `news`
    WHERE `date` > NOW() - INTERVAL 1 MINUTE
");
