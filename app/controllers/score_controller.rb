class ScoreController < ApplicationController
  def list
    @sumScore = params[:sumScore].to_i
    @maxSubject = params[:maxSubject]
    #------------------------------------------
    #@subject1 = Student.first
    @data = []
    Student.find_each do |students|
      @data.append([students.subject, students.points])
    end
  end
end
