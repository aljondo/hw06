defmodule Tracker.SocialTest do
  use Tracker.DataCase

  alias Tracker.Social

  describe "posts" do
    alias Tracker.Social.Post

    @valid_attrs %{completed: true, description: "some description", time: 42, title: "some title"}
    @update_attrs %{completed: false, description: "some updated description", time: 43, title: "some updated title"}
    @invalid_attrs %{completed: nil, description: nil, time: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Social.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Social.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Social.create_post(@valid_attrs)
      assert post.completed == true
      assert post.description == "some description"
      assert post.time == 42
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = Social.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.completed == false
      assert post.description == "some updated description"
      assert post.time == 43
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_post(post, @invalid_attrs)
      assert post == Social.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Social.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Social.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Social.change_post(post)
    end
  end

  describe "timeblocks" do
    alias Tracker.Social.TimeBlock

    @valid_attrs %{end_time: ~T[14:00:00.000000], start_time: ~T[14:00:00.000000], task_id: 42}
    @update_attrs %{end_time: ~T[15:01:01.000000], start_time: ~T[15:01:01.000000], task_id: 43}
    @invalid_attrs %{end_time: nil, start_time: nil, task_id: nil}

    def time_block_fixture(attrs \\ %{}) do
      {:ok, time_block} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_time_block()

      time_block
    end

    test "list_timeblocks/0 returns all timeblocks" do
      time_block = time_block_fixture()
      assert Social.list_timeblocks() == [time_block]
    end

    test "get_time_block!/1 returns the time_block with given id" do
      time_block = time_block_fixture()
      assert Social.get_time_block!(time_block.id) == time_block
    end

    test "create_time_block/1 with valid data creates a time_block" do
      assert {:ok, %TimeBlock{} = time_block} = Social.create_time_block(@valid_attrs)
      assert time_block.end_time == ~T[14:00:00.000000]
      assert time_block.start_time == ~T[14:00:00.000000]
      assert time_block.task_id == 42
    end

    test "create_time_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_time_block(@invalid_attrs)
    end

    test "update_time_block/2 with valid data updates the time_block" do
      time_block = time_block_fixture()
      assert {:ok, time_block} = Social.update_time_block(time_block, @update_attrs)
      assert %TimeBlock{} = time_block
      assert time_block.end_time == ~T[15:01:01.000000]
      assert time_block.start_time == ~T[15:01:01.000000]
      assert time_block.task_id == 43
    end

    test "update_time_block/2 with invalid data returns error changeset" do
      time_block = time_block_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_time_block(time_block, @invalid_attrs)
      assert time_block == Social.get_time_block!(time_block.id)
    end

    test "delete_time_block/1 deletes the time_block" do
      time_block = time_block_fixture()
      assert {:ok, %TimeBlock{}} = Social.delete_time_block(time_block)
      assert_raise Ecto.NoResultsError, fn -> Social.get_time_block!(time_block.id) end
    end

    test "change_time_block/1 returns a time_block changeset" do
      time_block = time_block_fixture()
      assert %Ecto.Changeset{} = Social.change_time_block(time_block)
    end
  end
end
