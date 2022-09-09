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
      
        if (@subject.strip === "")
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
        for i in 1..@numberSubject do
          @check = Student.where(subject: params["subject#{i}"].strip).first
          if (@check != nil)
            @check.points = params["score#{i}"].to_i
            @check.save
          else
            @tmp = Student.new
            @tmp.subject = params["subject#{i}"].strip    #.strip = avoid 'blank'
            @tmp.points = params["score#{i}"].to_i
            @tmp.save
          end
        end
        redirect_to "/score/list?sumScore=#{@sumScore}&maxSubject=#{@maxSubject}"
      end
    else
      @isFirst = params[:isFirst]
      @numberSubject = params[:numberSubject].to_i
    end
  end

  def test2
    # @sumScore = params[:sumScore].to_i
    # @maxSubject = params[:maxSubject]
  end
end
