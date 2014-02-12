class BidsController < ApplicationController

    def index
        @auction = Auction.find(auction_id)
        @bids = @auction.bids.order(:amount).reverse
    end

    def show
        @bid = Auction.find(auction_id).bids.find(bid_id)
        bid_amounts = @bid.auction.bids.map{ |b| b.amount }
        highest = 0
        bid_amounts.each{|a| highest = a if a > highest }
        @highest = @bid.amount >= highest
    end

    def new
        @bid = Auction.find(auction_id).bids.build
    end

    def create
        auction = Auction.find(auction_id)
        bid = auction.bids.create(bid_params)
        redirect_to [auction, bid]
    end

    def delete
    end

    def edit
        @bid = Auction.find(auction_id).bids.find(bid_id)
        render 'new'
    end

    def  update
        Auction.find(auction_id).bids.find(bid_id).update(bid_params)
        redirect_to auction_bid_path
    end

    private

    def auction_id
        params[:auction_id]
    end

    def bid_id
        params[:id]
    end

    def bid_params
        params.require(:bid).permit(:amount)
    end

end
