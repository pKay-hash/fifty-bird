ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
  self.score = params.score
end

function ScoreState:update(dt)
 if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
   gStateMachine:change('countdown')
 end
end

function ScoreState:render()
  -- simply render the score to the middle of the screen
  love.graphics.setFont(flappyFont)
  love.graphics.printf('Oh no! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(mediumFont)
  love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

  if self.score < 3 then
    love.graphics.draw(bronze, 35, 35, 0, 0.1, 0.09)
    love.graphics.draw(bronze, VIRTUAL_WIDTH - 110, 35, 0, 0.1, 0.09)
  end
  if self.score > 2 and self.score < 5 then
    love.graphics.draw(silver, 35, 35, 0, 0.1, 0.09)
    love.graphics.draw(silver, VIRTUAL_WIDTH - 110, 35, 0, 0.1, 0.09)
  end
  if self.score > 4 then
    love.graphics.draw(gold, 35, 35, 0, 0.1, 0.09)
    love.graphics.draw(gold, VIRTUAL_WIDTH - 110, 35, 0, 0.1, 0.09)
  end

  love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end
