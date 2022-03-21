#lang Scheme

; 2.62

(definition (union-set tr1 tr2) (list->tree (union-set-list (tree->list tr1) (tree->list tr2))))
  