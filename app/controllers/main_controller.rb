class MainController < ApplicationController
  def test
    @isAgain = params[:isAgain]
    if (@isAgain)
      @numberSubject = params[:numberSubject].to_i
      @subjectOld = []
      @scoreOld = []
      @isEmp = false

      @sumScore = 0
      @maxScore = params["score#{1}"].to_i
      @maxSubject = params["subject#{1}"]

      for i in 1..@numberSubject do
        @subject = params["subject#{i}"]
        @score = params["score#{i}"].to_i

        @sumScore += @score
        if (@maxScore < @score)
          @maxScore = @score
          @maxSubject = @subject
        end
      
        if (@subject === "")
          @isEmp = true
        else
          @subjectOld = @subjectOld.append(@subject)
        end
        if (params["score#{i}"] === "")
          @isEmp = true
          @scoreOld = @scoreOld.append(@score)
        end
      end

      if (@isEmp)
        
      else
        redirect_to "/main/test2?sumScore=#{@sumScore}&maxSubject=#{@maxSubject}"
      end
    else
      @numberSubject = params[:numberSubject].to_i
    end
  end

  def test2
    @sumScore = params[:sumScore].to_i
    @maxSubject = params[:maxSubject]
  end
end
