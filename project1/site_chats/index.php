<?php 
	session_start();
	require '../pages/header.php';
?>
<title>Live chat</title>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<link href="css/style.css" rel="stylesheet" id="bootstrap-css">
<script src="js/chat.js"></script>
<style>
	.modal-dialog {
	    width: 400px;
	    margin: 30px auto;	
	}
</style>
<div class="container">	
	<br>		
	<?php if(isset($_SESSION['userid']) && $_SESSION['userid']) { ?> 	
		<div class="chat">	
			<div id="frame">		
				<div id="sidepanel">
					<div id="profile">
						<?php
							require '../common/classes/profile.php';
							$chat = new Operations();
							$loggedUser = $chat->getUserDetails($_SESSION['userid']);
							echo '<div class="wrap">';
							$currentSession = '';
							foreach ($loggedUser as $user) {
								$currentSession = $user['current_session'];
								echo '<img id="profile-img" src="'.$user['profileImage'].'" class="online" alt="" />';
								echo  '<p>'.$user['userName'].'</p>';
									echo '<i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>';
									echo '<div id="status-options">';
									echo '<ul>';
										echo '<li id="status-online" class="active"><span class="status-circle"></span> <p>Online</p></li>';
										echo '<li id="status-away"><span class="status-circle"></span> <p>Away</p></li>';
										echo '<li id="status-busy"><span class="status-circle"></span> <p>Busy</p></li>';
										echo '<li id="status-offline"><span class="status-circle"></span> <p>Offline</p></li>';
									echo '</ul>';
									echo '</div>';
									echo '<div id="expanded">';			
									echo '<a href="logout.php">Logout</a>';
									echo '</div>';
							}
							echo '</div>';
						?>
					</div>
					<div id="search">
						<label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
						<input type="text" placeholder="Available People" readonly />					
					</div>
					<div id="contacts">	
						<?php
							echo '<ul>';
							$chatUsers = $chat->chatUsers($_SESSION['username']);
							foreach ($chatUsers as $user) {
								$status = 'offline';						
								if($user['online']) {
									$status = 'online';
								}
								$activeUser = '';
								if($user['userID'] == $currentSession) {
									$activeUser = "active";
								}
								echo '<li id="'.$user['userID'].'" class="contact '.$activeUser.'" data-touserid="'.$user['userID'].'" data-tousername="'.$user['userName'].'">';
								echo '<div class="wrap">';
								echo '<span id="status_'.$user['userID'].'" class="contact-status '.$status.'"></span>';
								echo '<img src="'.$user['profileImage'].'" alt="" />';
								echo '<div class="meta">';
								echo '<p class="name">'.$user['userName'].'<span id="unread_'.$user['userID'].'" class="unread">'.$chat->getUnreadMessageCount($user['userID'], $_SESSION['userid']).'</span></p>';
								echo '</div>';
								echo '</div>';
								echo '</li>'; 
							}
							echo '</ul>';
						?>
					</div>
				</div>			
				<div class="content" id="content"> 
					<div class="messages" id="conversation">		
					<?php
					echo $chat->getUserChat($_SESSION['userid'], $currentSession);						
					?>
					</div>
					<div class="message-input" id="replySection">				
						<div class="message-input" id="replyContainer">
							<div class="wrap">
								<input type="text" class="chatMessage" id="chatMessage<?php echo $currentSession; ?>" placeholder="Write your message..." />
								<button class="submit chatButton" id="chatButton<?php echo $currentSession; ?>"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>	
							</div>
						</div>					
					</div>
				</div>
			</div>
		</div>
	<?php } else { ?>
		<?php
			header("Location: ../pages/Home.php");
		 ?>		
	<?php } ?>
</div>	
<?php 
	require '../pages/footer.php';
?>