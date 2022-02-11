ScoreState = Class{__includes = BaseState}
 

function ScoreState:enter(params)
    self.score = params.score

    self.isMedal, self.medalType = MedalCheck(self.score)
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Over !!!!', 0, 54, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 10, VIRTUAL_WIDTH, 'center')
    if self.isMedal == true then
        love.graphics.printf('You won a ' .. self.medalType .. ' medal!!!! ', 10,90,VIRTUAL_WIDTH, 'center')
        love.graphics.draw(medals[self.medalType], (VIRTUAL_WIDTH / 2) - 32, 118)
      end
    love.graphics.printf('Press Enter to Play Again!', 0, 222, VIRTUAL_WIDTH, 'center')
end
 
    medals = {
        ['gold'] = love.graphics.newImage('gold.png'),
        ['silver'] = love.graphics.newImage('silver.png'),
        ['bronze'] = love.graphics.newImage('bronze.png'),
    } 


function MedalCheck(score)
     if score >= 30 then
          return true, 'gold'
     else if score >= 20 then
          return true, 'silver'
     else if score >= 10 then
          return true, 'bronze'
     else if score < 10 then 
          return false, ''
          end
       end 
    end
  end
end

