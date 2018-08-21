class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end
  
  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end
    
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path
    else
      render 'new'
    end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice:"ブログを削除しました！"
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  
  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name,:email,:content)
  end
  
  
    
    
end





