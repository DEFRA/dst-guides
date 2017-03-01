# The code is not 'yours'

> *We write and commit code thinking of someone else, not ourselves*

When we refer to code we often do so in a personal manner; 'my code', 'my commit', 'the class I wrote'. There is no harm in this (and trying to avoid it might lead to funny conversations!) but the key principle to remember is

> The code is not 'yours'

When writing code you should be thinking of *the next developer* who has to work with it, who may be your future self, another member of the team, or someone completely new.

They will not have the understanding and context you do at the time of writing it, so when they're amending or refactoring your work later it is important they can derive the intent of what your code is doing.

There are things at our disposal to help with this.

## Good naming

Naming is hard.

> There are only two hard things in Computer Science: cache invalidation and naming things.
>
> -- Phil Karlton

That said you can avoid basic errors such as

- Generic variable names: `p`, `temp`, `v`
- Using arrays over hashes: `['Bob', 'Smith', 'Bristol']` over `{ name: 'Bob', surname: 'Smith', location: 'Bristol' }`
- Use of acronyms: particularly domain specific ones. Someone new to the service may not know their GOR from their WIMS

Other than that when considering the name for a method, class, module etc try not to approach it from what makes sense to you, but instead what best describes the intent of the thing, and what will help the person who comes after you.

## Be conventional

If you're new to a language or framework, take the time to learn their conventions and naming standards. If you're very experienced you may have your own. Either way stick to the conventions.

The principle requires us to write the code thinking of someone else. That someone may not have the same background, or know our personal conventions so will find it harder to derive intent if the way the code has been written does not match what they expect to see.

For example you may have come from a background where this is the norm for a method name `isLimitedCompany()`. In Ruby though the convention would be to name this method `limited_company?()`. A new Rubyist to the team would find this jarring, and is likely to use the conventions leading to a inconsistent coding style.

## Relevant documentation

Lets be frank; few developers like writing documentation, whether its comments in the code or actual documentation like the README or accompanying wiki. So this principle doesn't advocate that **everything** should be covered. There is little value in documenting that `Person.name` gets and sets a person's name!

### Code and comments

Aim to write readable code that does not require comments.

Use the principle of **separate in order to name**. Essentially break your code down into small (and if necessary one line) sub routines that have names that express what their intent is. Read [Write readable code without comments](http://www.wikihow.com/Write-Readable-Code-Without-Comments) for more on how to do this.

If you have to add comments, make them useful

- **Comments are code** - Keep them small, simple and re-factor them as you make changes
- **Don't document the _how_** - Document *why* the thing is needed, or *why* its doing it the way it is
- **Comment in the right place** - Talk about the module at the module declaration, the subroutine at the method declaration etc
- **Only write about the code** - Don't include names, dates, commit comments or your opinions

Never commit commented out code. It's noise that only confuses. Use the commit history if you need to see what was there before.

And most importantly write them *as you write the code*. If you don't, you probably never will!

### Document the *how* for the project

When it comes to other developers or users of the project, the thing they are most interested in is the *how*. *How* can I build/deploy/run this project. *How* can I use it in my own work.

## Clean commit history

A clean commit history with meaningful messages is essential to understanding the decisions that led to the code being in its current form.

The [Pull request](/process/pull_request.md) process was put together to support this. Stick to it and your commit history should take care of itself.
