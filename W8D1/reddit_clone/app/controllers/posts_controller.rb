class PostsController < ApplicationController

    before_action :is_author?, only: [:edit, :update]

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = current_user.posts.new(post_params) #shouldn't be create, because we're doing @post.save
        #association prefills accessing certain user, moderator_id with current user's id

        if @post.save
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def update
        @post = Post.find_by(id: params[:id])

        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash[:errors] = ['Post cannot be edited']
            render :edit
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def destroy
        @post = Post.find_by(id: params[:id])

        if @post.destroy
            redirect_to subs_url
        else
            flash[:errors] = ['Post cannot be destroyed']
            redirect_to post_url(@post)
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :url, sub_ids: [])
    end


end
