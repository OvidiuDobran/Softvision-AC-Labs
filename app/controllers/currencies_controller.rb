class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:open_modal, :buy, :show, :edit, :update, :destroy]
  before_action :authorize

  # GET /currencies
  # GET /currencies.json
  def index
    @currencies = Currency.where.not(default: true)
  end

  # GET /currencies/1
  # GET /currencies/1.json
  def show
    
  end

  def get_amounts
    amounts=[]
    current_user.amounts.each do |amount|   
    puts amount.to_yaml
    if amount.quantity>0   
      amounts << [amount.currency.name, amount.quantity * amount.currency.price]
      end
    end
    render json:{key: amounts}
  end

  def open_modal
    @amount = params[:quantity].to_i
    render :partial => 'render_modal'
  end

  def buy
    amount = params[:amount]
    Amount.create(
      currency_id: @currency.id,
      quantity: amount.to_f,
      user_id: current_user.id
    )
    redirect_to currencies_path, notice:'Succesfully bought some coins'
  end

  # GET /currencies/new
  def new   
    if session[:user_id]==nil
      redirect_to '/login'
    else
      @currency = Currency.new
    end
  end

  # GET /currencies/1/edit
  def edit
  end

  # POST /currencies
  # POST /currencies.json
  def create
    @currency = Currency.new(currency_params)

    respond_to do |format|
      if @currency.save
        format.html { redirect_to @currency, notice: 'Currency was successfully created.' }
        format.json { render :show, status: :created, location: @currency }
      else
        format.html { render :new }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currencies/1
  # PATCH/PUT /currencies/1.json
  def update
    respond_to do |format|
      if @currency.update(currency_params)
        format.html { redirect_to @currency, notice: 'Currency was successfully updated.' }
        format.json { render :show, status: :ok, location: @currency }
      else
        format.html { render :edit }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currencies/1
  # DELETE /currencies/1.json
  def destroy
    @currency.destroy
    respond_to do |format|
      format.html { redirect_to currencies_url, notice: 'Currency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_params
      params.require(:currency).permit(:name, :symbol, :default)
    end
end
