#!/bin/sh

rails generate scaffold CharConfig statlinemax:integer elementdoublepct:integer

rails generate scaffold Race name:string

rails generate scaffold Stat name:string minval:integer maxval:integer

rails generate scaffold Resource name:string baseval:integer addstatline:boolean subtractstatline:boolean

rails generate scaffold OffenseType name:string numberofweapons:integer

rails generate scaffold Weapon name:string

rails generate scaffold ArmorType name:string

rails generate scaffold Element name:string

rails generate scaffold Shape name:string ordering:integer

rails generate scaffold Modifier name:string replacewithshape:boolean

rails generate scaffold WeaponOffenseTypeCombo alwayspick:boolean weapon:references offensetype:references

