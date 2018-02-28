# **Ed Goold's Gilded Rose Kata** ![CI status](https://img.shields.io/badge/build-passing-brightgreen.svg)

This is my response to the Gilded Rose Kata as part of the Tech Test  
week of the Dec 2017 Makers Academy cohort.

---

## Installation

### System Dependencies

* Ruby 2.4.1
* Rspec
* Rubocop

`$ bundle install`

---

## Approach Taken

Following Emily Bache's advice on this kata, I have taken the following  
three stage approach to solving the problem:

---  

**1**

#### Testing

I incorporated Rspec as the testing suite for the legacy codebase and developed  
automated tests to cover off the pre-existing functionality, testing for the  
following four broad areas:

- when dealing with **Standard stock**
 - normal quality reduction
 - normal sell_in reduction
 - quality reduction post sell_in expiry
 - quality cannot be negative

- when dealing with **Aged Brie**
 - increases in quality as sell_in value decreases
 - cannot increase in quality above 50

- when dealing with **Sulfuras**
 - does not decrease in sell_in value
 - does not decrease in quality

- when dealing with **Backstage passes**
 - increases in quality by 1 when 11+ days of sell_in value left
 - increases in quality by 2 when 10 days of sell_in value left
 - increases in quality by 2 when 6 days of sell_in value left
 - increases in quality by 3 when 5 days of sell_in value left
 - increases in quality by 3 when 1 day of sell_in value left
 - cannot increase in quality above 50 when incrementing in units of 1
 - cannot increase in quality above 50 when incrementing in units of 2
 - cannot increase in quality above 50 when incrementing in units of 3
 - decreases in quality to 0 when sell_in value reaches 0

I then used these tests as a perimeter to guide my refactoring and subsequently  
the development of new functionality.

---

**2**

#### Refactor the legacy codebase

The next stage was refactoring the legacy codebase.  I changed the update quality
 method so that it now consists of a case statement, which in turn refers  
 to four private methods dealing with respectively:

- Aged Brie
- Backstage passes
- Standard stock
- Quality limits

The majority if the substantive logic has now been taken out of the update  
quality method and passed into these private methods.

---

**3**

#### Conjured Items

I developed the conjured items functionality by writing the following tests:

 - while sell_in date extant, it decreases the quality of an item by a reduction
  of 2
 - reduces the sell_in value of the item by 1
 - once sell_in date passed, decreases the quality of an item by a reduction of 4  
 - cannot allow an item's quality to be negative

I then made these tests pass by including an additional statement in the update  
quality method that referred to a private conjured items method containing the  
relevant logic.

---

## Problem and Requirements

# Gilded Rose Refactoring Kata

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a
prime location in a prominent city ran by a friendly innkeeper named
Allison. We also buy and sell only the finest goods. Unfortunately, our
goods are constantly degrading in quality as they approach their sell by
date. We have a system in place that updates our inventory for us. It was
developed by a no-nonsense type named Leeroy, who has moved on to new
adventures. Your task is to add the new feature to our system so that we
can begin selling a new category of items. First an introduction to our
system:

- All items have a SellIn value which denotes the number of days we have
to sell the item
- All items have a Quality value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- "Aged Brie" actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- "Sulfuras", being a legendary item, never has to be sold or decreases
in Quality
- "Backstage passes", like aged brie, increases in Quality as it's SellIn
value approaches; Quality increases by 2 when there are 10 days or less
and by 3 when there are 5 days or less but Quality drops to 0 after the
concert

We have recently signed a supplier of conjured items. This requires an
update to our system:

- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any
new code as long as everything still works correctly. However, do not
alter the Item class or Items property as those belong to the goblin
in the corner who will insta-rage and one-shot you as he doesn't
believe in shared code ownership (you can make the UpdateQuality
method and Items property static if you like, we'll cover for you).

Just for clarification, an item can never have its Quality increase
above 50, however "Sulfuras" is a legendary item and as such its
Quality is 80 and it never alters.

---

## License

[MIT](https://choosealicense.com/licenses/mit/)
