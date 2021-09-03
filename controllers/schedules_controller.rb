class SchedulesController < ApplicationController
  def list
   @plan=Plan.all#planテーブルのデータ取得
  end
  
  def new
     @plan = Plan.new
  end
    def create
      @plan = Plan.new(plan_params)
      @plan.save
       if @plan.save
         flash[:notice] = "ユーザーを新規登録しました"
         redirect_to "/"
       else
           render "new"
       end
    end
    def plan_params
        params.permit(:title, :startTime, :endTime, :memo)
        #params.require(:plan)はplan.newで定義しているので不要
        #（もともとplanテーブルに保存されるものとして送信されているので
        #params.require(:plan)と書くとだぶる？）
         
    end
    def show
      @plan = Plan.find(params[:id])
    end
    
    def edit
         @plan = Plan.find(params[:id])
       
    end 
    
     def update
      plan = Plan.find(params[:id])
      plan.update(plan_params)
        flash[:notice] = "「#{@plan.id}」の情報を更新しました"
        redirect_to "/"
      
        render "edit"
      
     end   
    
    def destroy
         @plan = Plan.find(params[:id])
      @plan.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to "/"
    end
end
