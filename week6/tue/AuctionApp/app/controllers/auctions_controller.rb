class AuctionsController < ApplicationController

    def index
        @auctions = Auction.all
    end

    def show
        @auction = Auction.find(auction_id)
    end

    def new
        @auction = Auction.new
    end

    def create
        bid = Auction.create(auction_params).bids.create(bid_params)
        redirect_to bid.auction
    end

    def delete
    end

    def  update
    end

    private

    def auction_id
        params[:id]
    end

    def auction_params
        params.require(:auction).permit(:body)
    end

    def bid_params
        params.require(:auction).require(:bid).permit(:amount)
    end
end
