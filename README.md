# **Ed Goold's Gilded Rose Kata** ![CI status](https://img.shields.io/badge/build-passing-brightgreen.svg)

This is my response to the Gilded Rose Kata as part of the Tech Test  
week of the Dec 2017 Makers Academy cohort.

## Approach Taken

Following Emily Bache's advice on this kata, I have taken the following  
three stage approach to solving the problem:  

***1***

Incorporate Rspec as the testing suite for the codebase and develop automated  
tests to cover off the existing functionality.

At this stage, I have tested four broad areas as follows:

- when dealing with standard stock
- when dealing with Aged Brie
- when dealing with Sulfuras  
- when dealing with backstage passes

The idea is then to use these tests as a perimeter to guide my refactoring in the second stage.

***2***

Refactor the legacy codebase.

***3***

Develop the new conjured items feature described in the requirements.


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


## Installation

### System Dependencies

* Ruby 2.4.1
* Rspec
* Rubocop

`$ bundle install`

## Usage

```

```


## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
