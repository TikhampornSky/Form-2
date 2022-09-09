class ScoreController < ApplicationController
  def list
    @sumScore = params[:sumScore].to_i
    @maxSubject = params[:maxSubject]
    #------------------------------------------
    @commit = params[:commit]
    if (@commit == "Delete")
      Student.delete(params[:id_edit])
    end
    #------------------------------------------
    #@subject1 = Student.first
    @data = []
    Student.find_each do |students|
      @data.append([students.subject, students.points, students.id])
    end
  end

  def edit
    @fromEdit = params[:fromEdit]
    if (@fromEdit)
      @subject_update = params[:subject_update]
      @point_update = params[:point_update]
      @id_update = params[:id_update]
      #---------------Handle If it is "BLANK"-----------------
      @isSubEmp = false
      @isScoreEmp = false
      if (@subject_update.strip === "")
        @isSubEmp = true
      end
      if (@point_update === "")
        @isScoreEmp = true
      end
      #-------------------------------------------------------
      @updateSuccess = false
      #@updateDuplicate = false
      if (@isSubEmp || @isScoreEmp)

      else
        @check = Student.where(id: @id_update).first                         #Update data           
        @check.subject = @subject_update.strip
        @check.points = @point_update.to_i
        @check.save
        @updateSuccess = true
      end

      @subject_edit = @subject_update       #Show update value
      @point_edit = @point_update
      @id_edit = @id_update
    else                                    #for first time visit this page
      @subject_edit = params[:subject_edit]
      @point_edit = params[:point_edit].to_i
      @id_edit = params[:id_edit].to_i
    end
  end
end