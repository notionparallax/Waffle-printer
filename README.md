# Waffle-printer
A quick and dirty way of printing waffle cards.

We* needed a way to get our cards out of waffle.io 

We really like [git2pdf](https://github.com/pocketworks/git2pdf) by [Pocketworks](http://www.pocketworks.co.uk/) but because it pulls from Github the story points don't come through.

We got around this in the quickest dirtyest way we could. We might make it better in future if we need to, but for today this does the job.

## How

Clone this repo.

You need the `cards` json from the waffle page. You can get it by inspecting the page, going to Networks and waiting until the page has finished loading. It's just `cards` not `cards.json`. Copy the response body.

![an image of the inspector showing the payload](https://raw.githubusercontent.com/notionparallax/Waffle-printer/master/response.png)

Save it into `cards.json`

From inside this folder run `cat cards.json | ruby waffle-cards-printer.rb > cards.html`

Open `cards.html` and print it.

#so

This is super clunky. If you have any better ideas then we're all ears!

* We is @dawil and @notionparallax

![the outcome](https://lh3.googleusercontent.com/djRNCdOe1TE1EKYegx71wO3qbaCSDweZJdO6_CAbMLOm=w1459-h993-no)
