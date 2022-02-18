<?php

class Paginator
{
    /** @var int Количество елементов на странице */
    public int $itemsOnPage = 3;

    /** @var int Общее количество елементов */
    public int $numberOfItems = 0;

    /** @var int Количество выводимых страниц пагинатора */
    public int $shownPaginatorPages = 5;

    /**
     * Количество страниц пагинатора
     *
     * @return int
     */
    public function numberOfPages(): int
    {
        return ceil($this->numberOfItems / $this->itemsOnPage);
    }

    /**
     * Текущая страница
     *
     * @return int
     */
    public function currentPage(): int
    {
        $currentPage = $_GET['p'] ?? 1;
        if ((int)$currentPage < 1) {
            $currentPage = 1;
        }
        if ((int)$currentPage > $this->numberOfPages()) {
            $currentPage = $this->numberOfPages();
        }
        return $currentPage;
    }

    /**
     * С какой записи выбирать
     *
     * @return int
     */
    public function itemToBegin(): int
    {
        return ($this->currentPage() - 1) * $this->itemsOnPage;
    }

    /**
     * Данные для LIMIT (с кокой записи выбирать, к-тво записей)
     *
     * @return string
     */
    public function sqlQueryLimit(): string
    {
        return ' LIMIT ' . $this->itemToBegin() . ', ' . $this->itemsOnPage;
    }

    /**
     * К-ство отображаемых страниц пагинатора
     *
     * @return int
     */
    public function shownPaginatorPages(): int
    {
        return $this->shownPaginatorPages < $this->numberOfPages()
            ? $this->shownPaginatorPages
            : $this->numberOfPages();
    }

    /**
     * Первая отображаемая страница пагинатора
     *
     * @return int
     */
    public function startPaginator(): int
    {
        $start = 1;
        if ($this->currentPage() - floor($this->shownPaginatorPages() / 2) > 1) {
            $start = $this->currentPage() - floor($this->shownPaginatorPages() / 2);
        }

        if (($this->numberOfPages() - $this->currentPage()) < floor($this->shownPaginatorPages() / 2)) {
            $start = $this->numberOfPages() - $this->shownPaginatorPages() + 1;
        }

        return $start;
    }

    /**
     * Последняя отображаемая страница пагинатора
     *
     * @return int
     */
    public function endPaginator(): int
    {
        return ($this->startPaginator() + $this->shownPaginatorPages()) <= $this->numberOfPages()
            ? $this->startPaginator() + $this->shownPaginatorPages()
            : $this->numberOfPages() + 1;
    }

    /**
     * Предидущая страница
     *
     * @return int
     */
    public function previousPage(): int
    {
        return ($this->currentPage() - 1) > 0
            ? $this->currentPage() - 1
            : 1;
    }

    /**
     * Следующая страница
     *
     * @return int
     */
    public function nextPage(): int
    {
        return ($this->currentPage() + 1) > $this->numberOfPages()
            ? $this->numberOfPages()
            : $this->currentPage() + 1;
    }
}