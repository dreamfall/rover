# Mars Rover Test App

### Usage example
```
$ irb -r ./app/command_receiver.rb
irb(main):001:0> receiver = CommandReceiver.new("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
=> #<CommandReceiver:0x007f9e2200af60 @commands=["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]>
irb(main):002:0> receiver.process!
1 3 N
5 1 E
=> [#<Rover:0x007f9e220080d0 @x=1, @y=3, @direction="N", @plateau=#<Plateau:0x007f9e220082d8 @width=5, @height=5, @rovers=[...]>>, #<Rover:0x007f9e2202baf8 @x=5, @y=1, @direction="E", @plateau=#<Plateau:0x007f9e220082d8 @width=5, @height=5, @rovers=[...]>>]
```

### Testing
```
bundle exec rake
```
or
```
bundle exec rspec
```
