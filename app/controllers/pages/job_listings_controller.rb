module Pages
  class JobListingsController < ApplicationController
    before_action :authenticate_user!, except: [ :index, :show ]
    before_action :set_pages_job_listing, only: %i[ show edit update destroy ]

    # GET /pages/job_listings or /pages/job_listings.json
    def index
      @pages_job_listings = Pages::JobListing.all
    end

    # GET /pages/job_listings/1 or /pages/job_listings/1.json
    def show
    end

    # GET /pages/job_listings/new
    def new
      @pages_job_listing = Pages::JobListing.new
    end

    # GET /pages/job_listings/1/edit
    def edit
    end

    # POST /pages/job_listings or /pages/job_listings.json
    def create
      @pages_job_listing = Pages::JobListing.new(pages_job_listing_params)

      respond_to do |format|
        if @pages_job_listing.save
          format.html { redirect_to @pages_job_listing, notice: "Job listing was successfully created." }
          format.json { render :show, status: :created, location: @pages_job_listing }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @pages_job_listing.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /pages/job_listings/1 or /pages/job_listings/1.json
    def update
      respond_to do |format|
        if @pages_job_listing.update(pages_job_listing_params)
          format.html { redirect_to @pages_job_listing, notice: "Job listing was successfully updated." }
          format.json { render :show, status: :ok, location: @pages_job_listing }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @pages_job_listing.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /pages/job_listings/1 or /pages/job_listings/1.json
    def destroy
      @pages_job_listing.destroy!

      respond_to do |format|
        format.html { redirect_to pages_job_listings_path, status: :see_other, notice: "Job listing was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_pages_job_listing
      @pages_job_listing = Pages::JobListing.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def pages_job_listing_params
      params.expect(pages_job_listing: [ :title, :salary, :body, :company, :location, :meta_image, :bunner_image, :tags, :user_id ])
    end
  end
end
