class EmailsController < ApplicationController
  def index
    @email = Email.all
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(object: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem.paragraph(sentence_count: 4), read: false)
    respond_to do |format|
      if @email.save
        format.html { redirect_to root_path }
        format.js { }
        flash[:notice] = "Email créé"
      else
        format.html { redirect_to root_path }
        format.js { }
        flash[:notice] = "Veuillez essayer à nouveau"
      end
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def edit
  end

  def update
    @email = Email.find(params[:id])
    if @email.read == true
      @email.update(read: false)
      flash[:success] = "Votre email est marqué comme non-lu !"
      redirect_to root_path
    else
      @email.update(read: true)
      flash[:success] = "Votre email est marqué comme lu !"
      redirect_to root_path
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

end
